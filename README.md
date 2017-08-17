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
