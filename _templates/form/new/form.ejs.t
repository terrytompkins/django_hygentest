---
to: <%= cwd %>/<%= app %>/forms.py
force: true
---
from django import forms
<%
let parsedModels = Array.isArray(models) ? models : JSON.parse(models);
parsedModels.forEach(function(model) {
%>
from .models import <%- h.changeCase.pascalCase(model.name) %>

class <%- h.changeCase.pascalCase(model.name) %>Form(forms.ModelForm):
    class Meta:
        model = <%- h.changeCase.pascalCase(model.name) %>
        fields = '__all__'

<% }); %>
