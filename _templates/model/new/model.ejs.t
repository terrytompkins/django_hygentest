---
to: models.py
force: true
---
from django.db import models

<%
let parsedModels = Array.isArray(models) ? models : JSON.parse(models);
parsedModels.forEach(function(model) {
%>

class <%- h.changeCase.pascalCase(model.name) %>(models.Model):
<% model.fields.forEach(function(field) { 
     var fieldType = 'models.' + field.type;
     var fieldName = field.name; -%>
    <%- fieldName %> = <%- fieldType %>(<% if (field.options) { %><%- field.options %><% } %>)
<% }); -%>

    def __str__(self):
        return self.<%- model.fields.length > 0 ? model.fields[0].name : '' %>

<% }); %>
