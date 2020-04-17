module AssistSingleAssociation
  class Define

    attr_reader :klass

    def initialize(klass)
      @klass = klass
    end

    def execute
      klass.reflections.each do |_relation_name, relation|
        next unless relation.is_a?(permit_class)
        relation.klass.defined_enums.each do |enum_name, val|
          val.keys.each do |key|
            define_association_methods(key: key, relation_name: relation.name, enum_name: enum_name)
          end
        end
      end
    end

    private

    def permit_class
      @permit_class ||= ActiveRecord::Reflection::HasOneReflection
    end

    def define_association_methods(h = {})
      klass.class_eval do
        define_method(:"build_#{h[:key]}_#{h[:relation_name]}") do |attributes = {}|
          send(:"build_#{h[:relation_name]}", { "#{h[:enum_name]}": h[:key], **attributes })
        end

        define_method(:"create_#{h[:key]}_#{h[:relation_name]}") do |attributes = {}|
          send(:"create_#{h[:relation_name]}", { "#{h[:enum_name]}": h[:key], **attributes })
        end
      end
    end
  end
end
