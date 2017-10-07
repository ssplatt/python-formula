# vim: ft=sls
# How to install python
{%- from "python/map.jinja" import python with context %}

{% if python.version == '3' or python.version == 3 %}
{% set pythonprefix = 'python3' %}
{% else %}
{% set pythonprefix = 'python' %}
{% endif %}

{{ pythonprefix }}_pkg:
  pkg.installed:
    - name: {{ pythonprefix }}

{% if python.from_pkgs and python.modules is defined %}
{# from packages #}
  {% for module in python.modules %}
{{ pythonprefix }}_module_{{ module }}_package:
  pkg.installed:
    - name: {{ pythonprefix }}-{{ module }}
  {% endfor %}

{% elif python.modules is defined %}
{# from pip #}
{{ pythonprefix }}_pip_pkg:
  pkg.installed:
    - name: {{ pythonprefix }}-pip

{{ pythonprefix }}_dev_pkg:
  pkg.installed:
    - name: {{ pythonprefix }}-dev

  {% if python.version == '3' or python.version == 3 %}
{# salt's pip state requires python2 pip to be installed #}
python2_pip_pkg:
  pkg.installed:
    - name: python-pip
  {% endif %}

  {% if python.deps is defined %}
{{ pythonprefix }}_pip_deps:
  pkg.installed:
    - pkgs: {{ python.deps }}
  {% endif %}

  {% for module in python.modules %}
{{ pythonprefix }}_module_{{ module }}_pip:
  pip.installed:
    - name: {{ module }}
    - bin_env: /usr/bin/pip{{ python.version }}
    - require:
      - pkg: {{ pythonprefix }}_pip_pkg
      - pkg: {{ pythonprefix }}_dev_pkg
  {% endfor %}

{% endif %}
