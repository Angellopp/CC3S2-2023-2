=begin
Una aplicación de juguete de Sinatra para demostrar el concepto básico de MVC, rutas RESTful y CRUD.
Ejecuta "bundle install" para asegurarte de tener las gemas necesarias instaladas.
Para ejecutar el script, escribe "ruby final.rb" en la línea de comandos.
Actualizado por: Jeremy Warner, autor original: Hezheng Yin
=end

# cargar las bibliotecas que necesitamos
require 'sinatra'
require 'active_record'
require 'json'

# decirle a active_record a qué base de datos conectarse
db_options = {adapter: 'sqlite3', database: 'todos_db'}
ActiveRecord::Base.establish_connection(db_options)

# escribir la clase de migración para crear la tabla Todo en la base de datos
### ¿cómo escribimos migraciones en Rails?
class CreateTodos < ActiveRecord::Migration[5.0]
  def change
    create_table :todos do |t|
      t.string :description
    end
  end
end

# crear la tabla Todo ejecutando la función que acabamos de escribir
### ¿cómo aplicamos migraciones en Rails?
### ¿por qué manejamos una excepción aquí?
begin
  CreateTodos.new.change
rescue ActiveRecord::StatementInvalid
  # probablemente está bien
end

# crear la clase Todo heredando de ActiveRecord::Base
### ¿cómo escribimos una nueva clase en Rails?
### ¿por qué no hay métodos setter y getter (o attr_accessor)?
class Todo < ActiveRecord::Base
  validates :description, presence: true, allow_blank: false
end

# poblar la base de datos si está vacía (evitar ejecutar este código dos veces)
### ¿aún recuerdas esta sintaxis de hash más limpia y simple?
if Todo.all.empty?
  Todo.create(description: "preparar para la sección de discusión")
  Todo.create(description: "lanzar cc 3s2")
end

# mostrar todos los todos
get '/todos' do
  content_type :json
  Todo.all.to_json
end

# mostrar un todo específico
get '/todos/:id' do
  content_type :json
  todo = Todo.find_by_id(params[:id])
  if todo
    return {description: todo.description}.to_json
  else
    return {msg: "error: no se encontró el todo especificado"}.to_json
  end
end

# crear un nuevo todo
# objetivo: si recibimos una descripción no vacía, renderizar json con msg establecido en "create success"
# de lo contrario, renderizar json con msg establecido en "error: la descripción no puede estar en blanco"
post '/todos' do
  content_type :json
  todo = Todo.new(description: params[:description])
  if todo.save
    return {msg: "creación exitosa"}.to_json
  else
    return {msg: todo.errors}.to_json
  end
end

# actualizar un todo
# retorno: si existe un todo con el id especificado y la descripción no está vacía, renderizar json con msg establecido en "actualización exitosa"
# de lo contrario, renderizar json con msg establecido en "falla de actualización"
put '/todos/:id' do
  content_type :json
  todo = Todo.find(params[:id])
  if todo.update_attribute(:description, params[:description])
    return {msg: "actualización exitosa"}.to_json
  else
    return {msg: todo.errors}.to_json
  end
end