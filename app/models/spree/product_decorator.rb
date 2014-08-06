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
  end
end
