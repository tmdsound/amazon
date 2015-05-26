---
layout: page_a
title: "europe"
category: asia
description: ""
cat: asia
---
{% include JB/setup %}

{% for tag in site.tags %} 
	{% if tag[0] == 'asia'%}

  <ul >
    {% assign pages_list = tag[1] %} 
    {% include JB/pages1_list %}
   
  </ul>
  {% endif %}
{% endfor %}
