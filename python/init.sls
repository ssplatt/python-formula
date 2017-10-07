# vim: ft=sls
# Init python
{%- from "python/map.jinja" import python with context %}
{# Below is an example of having a toggle for the state #}

{% if python.enabled %}
include:
  - python.install
{% else %}
'python-formula disabled':
  test.succeed_without_changes
{% endif %}

