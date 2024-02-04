---
to: templates/<%- h.changeCase.snakeCase(model_name) %>/list.html
force: true
---
{% extends 'base.html' %}

{% block content %}
<% let parsedModel = Array.isArray(model) ? model : JSON.parse(model); -%>
<div class="container">
    <h2><%- h.changeCase.titleCase(parsedModel.name) %> List</h2>
    <table>
        <thead>
            <tr>
            <% parsedModel.fields.forEach(function(field) { %>
                <th><%- h.changeCase.titleCase(field.name) %></th>
            <% }); %>
            </tr>
        </thead>
        <tbody>
            {% for item in object_list %}
            <tr>
                <% parsedModel.fields.forEach(function(field) { %>
                <td>{{ item.<%- field.name %> }}</td>
                <% }); %>
            </tr>
            {% endfor %}
        </tbody>
    </table>
</div>
{% endblock %}
