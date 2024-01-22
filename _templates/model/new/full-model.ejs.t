---
to: <%= cwd %>/<%= app %>/models.py
force: true
---
from django.db import models
<%
let parsedModels = Array.isArray(models) ? models : JSON.parse(models);
parsedModels.forEach(function(model) { 
-%>
class <%- h.changeCase.pascalCase(model.name) %>(models.Model):
	<% model.fields.forEach(function(field) { 
		var fieldOptions = [];
		Object.keys(field).forEach(function(option) {
			if (option !== 'name' && option !== 'type') {
				var value = field[option];
				if (typeof value === 'string') {
					value = `'${value}'`;
				}
				fieldOptions.push(`${option}=${value}`);
			}
		});
	-%>
<%- field.name %> = models.<%- field.type %>(<%- fieldOptions.join(', ') -%>)
	<% }); -%>
<% (model.relationships || []).forEach(function(relationship) {
	var relOptions = [`to='${relationship.to}'`, `related_name='${relationship.related_name}'`, `on_delete=models.${relationship.on_delete}`];
-%>
<%- relationship.name %> = models.<%- relationship.type %>(<%- relOptions.join(', ') %>)
    <% }); -%>

	class Meta:
	<% Object.keys(model.meta || {}).forEach(function(metaOption) { 
		var value = model.meta[metaOption];
		if (typeof value === 'string') {
			value = `'${value}'`;
		}
	-%>
	<%- metaOption %> = <%- value %>
	<% }); -%>

		def __str__(self):
			return self.<%- model.fields[0].name %>
<% }); %>
