---
to: templates/<%- h.changeCase.snakeCase(model.name) %>_detail.html
force: true
---
{% extends 'base.html' %}

{% block content %}
<div class="container">
    <h2><%- h.changeCase.titleCase(model.name) %> Detail</h2>
    <dl>
        <% model.fields.forEach(function(field) { %>
        <dt><%- h.changeCase.titleCase(field.name) %></dt>
        <dd>{{ item.<%- field.name %> }}</dd>
        <% }); %>
        <% (model.relationships || []).forEach(function(relationship) { %>
        <dt><%- h.changeCase.titleCase(relationship.name) %></dt>
        <dd>{{ item.<%- relationship.name %> }}</dd>
        <% }); %>
    </dl>
</div>
{% endblock %}
