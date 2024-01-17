---
to: <%= cwd %>/<%= app %>/views.py
force: true
---
from django.views import generic

<%
let parsedModels = Array.isArray(models) ? models : JSON.parse(models);
parsedModels.forEach(function(model) {
%>
from .models import <%- h.changeCase.pascalCase(model.name) %>

class <%- h.changeCase.pascalCase(model.name) %>ListView(generic.ListView):
    model = <%- h.changeCase.pascalCase(model.name) %>
    template_name = '<%- model.name.toLowerCase() %>_list.html'
    context_object_name = 'all_<%- model.name.toLowerCase() %>'

class <%- h.changeCase.pascalCase(model.name) %>DetailView(generic.DetailView):
    model = <%- h.changeCase.pascalCase(model.name) %>
    template_name = '<%- model.name.toLowerCase() %>_detail.html'

class <%- h.changeCase.pascalCase(model.name) %>CreateView(generic.CreateView):
    form_class = <%- h.changeCase.pascalCase(model.name) %>Form
    template_name = '<%- model.name.toLowerCase() %>_form.html'

class <%- h.changeCase.pascalCase(model.name) %>UpdateView(generic.UpdateView):
    form_class = <%- h.changeCase.pascalCase(model.name) %>Form
    model = <%- h.changeCase.pascalCase(model.name) %>
    template_name = '<%- model.name.toLowerCase() %>_form.html'

<% }); %>
