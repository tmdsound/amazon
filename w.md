---
layout: page_a
title: "W"
description: ""
category: tuning
cat: tuning
---
saflaflasdfas


{% include JB/setup %}

{% for tag in site.tags %} 
{% if tag[0] == 'europe'%}
{% assign europe_list = tag[1] %}

{% for node in europe_list %}
<li class="menu-item">
<a href="/{{node.category}}/">{{node.category}}</a>
</li>

{% endfor %}	 
{% endif %}		
{% endfor %}


{% assign delimiter = "," %}
{% assign names_str = "" %}
{% assign names = europe_list | map: 'category' %}

{% for name in names %}
    {% assign names_arr = names_str | split: delimiter %}
    {% unless names_arr contains name %}
        {% assign names_str = names_str | append: delimiter | append: name %}
    {% endunless %}
{% endfor %}
{% assign names_uniq_europe = names_str | remove_first: delimiter | split: delimiter  %}

<a href="#">{{ names_uniq_europe }}</a>

{% for gfd in names_uniq_europe %}

<li>{{ gfd }}</li>	
	
{% endfor %}

{{ europe_list | map:'categories' | join:' ' }}


{% assign fruits = "orange apple banana apple orange" %}
{{ fruits | split: ' ' | uniq | join: ','  }}
{% assign array_n = 'Вася, Петя, Федя, Петя, Вася'  %}
{{ array_n | uniq }}


