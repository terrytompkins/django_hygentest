---
to: templates/<%= h.changeCase.snakeCase(model_name) %>/detail.html
force: true
---
{% extends 'base.html' %}

{% block content %}
<% let parsedModel = Array.isArray(model) ? model : JSON.parse(model); -%>
<div class="container">
    <h2><%- h.changeCase.titleCase(parsedModel.name) %> Detail</h2>
    <dl>
        <% parsedModel.fields.forEach(function(field) { %>
        <dt><%- h.changeCase.titleCase(field.name) %></dt>
        <dd>{{ item.<%- field.name %> }}</dd>
        <% }); %>
        <% (parsedModel.relationships || []).forEach(function(relationship) { %>
        <dt><%- h.changeCase.titleCase(relationship.name) %></dt>
        <dd>{{ item.<%- relationship.name %> }}</dd>
        <% }); %>
    </dl>
</div>
{% endblock %}
