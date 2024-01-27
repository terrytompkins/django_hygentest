---
to: <%= cwd %>/<%= app %>/urls.py
force: true
---
from django.urls import path
from . import views

urlpatterns = [
<% 
let parsedModels = Array.isArray(models) ? models : JSON.parse(models);
parsedModels.forEach(function(model) {
var modelName = h.changeCase.camelCase(model.name);
var modelNamePlural = h.inflection.pluralize(modelName);
%>
    path('<%- modelNamePlural %>/', views.<%- h.changeCase.pascalCase(model.name) %>ListView.as_view(), name='<%- modelNamePlural %>_list'),
    path('<%- modelNamePlural %>/create/', views.<%- h.changeCase.pascalCase(model.name) %>CreateView.as_view(), name='<%- modelName %>_create'),
    path('<%- modelNamePlural %>/<int:pk>/', views.<%- h.changeCase.pascalCase(model.name) %>DetailView.as_view(), name='<%- modelName %>_detail'),
    path('<%- modelNamePlural %>/<int:pk>/update/', views.<%- h.changeCase.pascalCase(model.name) %>UpdateView.as_view(), name='<%- modelName %>_update'),
    path('<%- modelNamePlural %>/<int:pk>/delete/', views.<%- h.changeCase.pascalCase(model.name) %>DeleteView.as_view(), name='<%- modelName %>_delete'),
<% }); %>
]
