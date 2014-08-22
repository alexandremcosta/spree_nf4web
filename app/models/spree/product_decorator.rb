module Spree
  Product.class_eval do
    def ncm
      property('ncm') || ''
    end

    def unit
      property('unit') || ''
    end

    def subst
      property('subst') || 0
    end

    def nfe4web_name
      name.first(60)
    end

    def nfe4web_description
      description.first(120)
    end
  end
end
