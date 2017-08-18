# Omega
Progetto per il laboratorio di architetture software e sicurezza informatica.

Startup + Insertion

Inizializzo l’app di base con:

> rails new omega
> cd omega
> bundle update && bundle install

Per prima cosa creo i locali (properties), quindi creo il Model e il corrispondente Controller. Inizialmente il locale non ha tutti gli attributi necessari. Poi si aggiungeranno altri attributi man mano tramite opportune migration.

> rails generate model Property titolo:string descrizione:text prezzo:float
> rails db:migrate

Successivamente creiamo il Controller con:

> rails generate controller properties

Iniziamo a settare qualche route, quindi andiamo nel file config/routes.rb e aggiungiamo:

root “properties#index”
resources :properties

e lanciamo il comando

> rails routes

Aggiungiamo al controller il metodo index e il metodo new, e creiamo la view new.html.erb così definita:

<h1>Crea Inserzione</h1>
<%= form_for :property, url:properties_path do |p| %>
    <p>
        <%= p.label :titolo %><br>
        <%= p.text_field :titolo %><br>
    </p>

    <p>
        <%= p.label :descrizione %><br>
        <%= p.text_area :descrizione %>
    </p>

    <p>
        <%= p.label :prezzo %><br>
        <%= p.text_field :prezzo %><br>
    </p>

    <p>
        <%= p.submit %>
    </p>
<% end %>

Ora definiamo il metodo create nel seguente modo:

def create
    @property = Property.new(property_params)
    @property.save
    redirect_to @property
end

e sempre nel controller aggiungiamo in fondo il seguente codice:

private def property_params
    params.require(:property).permit(:titolo, :descrizione, :prezzo)
end

Ora creiamo il metodo show nel PostsController, sotto il metodo index, così definito:

def show
    @property = Property.find(params[:id])
end

e la view show con il seguente codice:

<h2><%= @property.titolo %></h2>
<p><%= @property.descrizione %></p>
<p><%= @property.prezzo %>€</p>

<%= link_to "Index", properties_path %>

Modifichiamo il metodo index nel modo seguente:

def index
    @properties= Property.all
end

e il file index nel seguente modo:


<h1>Inserzioni</h1>
<% @properties.each do |p| %>
    <h3><%= p.titolo %></h3>
    <p><%= p.descrizione %></p>
    <p><%= p.prezzo %> €</p>
    <%= link_to "Vedi", property_path(p) %>
<hr>
<% end %>

Aggiungiamo ora le operazioni CRUD di Update e Delete (la Create e la Read le abbiamo gia implementate). Per quanto riguarda la Update, mettiamo un bottone “Modifica” nella show di ogni property. La stessa cosa sarà per la Delete. Aggiungiamo alla show la seguente riga:

<%= link_to "Modifica", edit_property_path(@property) %>

e creiamo il metodo ‘edit’ nel controller così definito:

def edit
    @property = Property.find(params[:id])
end

poi creiamo la view ‘edit’ cos’ definita:

<h1>Modifica Inserzione</h1>
<%= form_for :property, url: property_path(@property), method: :patch do |p| %>

    <p>
        <%= p.label :titolo %><br>
        <%= p.text_field :titolo %>
    </p>


    <p>
        <%= p.label :descrizione %><br>
        <%= p.text_area :descrizione %>
    </p>

    <p>
        <%= p.label :prezzo %><br>
        <%= p.text_field :prezzo %>
    </p>

    <p>
        <%= p.submit %>
    </p>
<% end %>

e aggiungiamo nel Controller il metodo update così definto:

def update
    @property = Property.find(params[:id])

    if(@property.update(property_params))
        redirect_to @property
    else
        render 'edit'
    end
end

___________________________________________________________________________________

Remove

Per quanto riguarda la Delete, creiamo nel Controller il seguente metodo:

def destroy
    @property = Property.find(params[:id])
    @property.destroy

    redirect_to properties_path
end

e aggiungiamo il seguente bottone nella view show dove si ritiene opportuno:

<%= link_to "Elimina", property_path(@property),
			method: :delete,
		        data: {confirm: 'Are you sure?'},
			:class => 'btn btn-danger' %>
___________________________________________________________________________________

Devise (Sign Up + Log In)

Apriamo il Gemfile e inseriamo la riga

gem ‘devise’

e lanciamo il comando

> bundle install

Successivamente diamo il comando

>rails generate devise:install

Appariranno delle istruzioni sul terminale. Eseguiamole, cioè apriamo il file config/environments/development.rb e inseriamo la seguente riga:

config.action_mailer.default_url_options = { host: 'localhost', port: 3000 }

Poi apriamo il file app/views/layouts/application.html.erb e inseriamo nel body il seguente codice (sopra o sotto lo yield):

<p class="notice"><%= notice %></p>
<p class="alert"><%= alert %></p>
infine diamo il comando

> rails generate devise:views

Successivamente dobbiamo creare il Model per gli utenti, tramite devise. Diamo quindi i comandi

> rails generate devise User
> rake db:migrate

Ora dobbiamo modificare i metodi new e create del Controller. In particolare dobbiamo sostituire le stringhe Property.new con la stringa ‘current_user.properties.build’
Poi dobbiamo creare nel database le relazioni tra User e Property. Quindi diamo il comando

> rails g migration add_user_id_to_properties user_id:integer
> rake db:migrate

poi apriamo il model User.rb e inseriamo la stringa

has_many :properties

e il model Property.rb e inseriamo la stringa

belongs_to :user

Poi inseriamo nel file  app/views/layouts/application.html.erb, all’inizio del body, il seguente codice:

<% if user_signed_in? %>
    <%= link_to “Esci”, destroy_user_session_path, method: :delete %>
<% else %>
    <%= link_to “Accedi”, new_user_session_path %>
    <%= link_to “Registrati”,  new_user_registration_path %>
<% end %>

Se vogliamo che per inserire inserzioni o modificarle ecc… si deve essere loggati, allora all’inizio del Controller inseriamo il seguente codice:

before_action :authenticate_user!, except: [:index, :show]

Infine se vogliamo che solo chi ha inserito il prorio locale possa modificarlo o eliminarlo sostituiamo la show con il seguente codice:

<h2><%= @property.titolo %></h2>
<p><%= @property.descrizione %></p>
<p><%= @property.prezzo %>€</p>
Inserzione di: <%= @property.user.email %><hr>

<% if @property.user == current_user %>
	<%= link_to "Modifica", edit_property_path(@property) %>
	<%= link_to "Elimina", property_path(@property),
			method: :delete,
		        data: {confirm: 'Are you sure?'},
			:class => 'btn btn-danger' %>
<% end %>
<hr>
<%= link_to "Index", properties_path %>
