# Be sure to restart your server when you modify this file.

# Add new inflection rules using the following format
# (all these examples are active by default):
 ActiveSupport::Inflector.inflections do |inflect|
#   inflect.plural /^(ox)$/i, '\1en'
#   inflect.singular /^(ox)en/i, '\1'
#   inflect.irregular 'person', 'people'
#   inflect.uncountable %w( fish sheep )

    inflect.irregular 'localidad', 'localidades'
    inflect.irregular 'contratista', 'contratistas'
    inflect.irregular 'tipo_certificado', 'tipos_certificados'
    inflect.irregular 'tipo_norma_legal', 'tipos_normas_legales'
    inflect.irregular 'tipo_estado', 'tipos_estados'

 end
#
# These inflection rules are supported but not enabled by default:
# ActiveSupport::Inflector.inflections do |inflect|
#   inflect.acronym 'RESTful'
# end
