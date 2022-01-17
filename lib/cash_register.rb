class CashRegister
    attr_reader :discount
    attr_accessor :total, :items, :last_transaction

    def initialize(discount=0) 
        @total = 0
        @discount = discount
        @items = []
    end

    def add_item(title, price, quantity=1)
        # @total += (price * quantity)
        # refactored so void_last_transaction is easier
        @last_transaction = price * quantity  
        @total += @last_transaction

        # adding all quantities that's been added to items arr
        quantity.times do   
            @items << title
        end    
    end

    def apply_discount
        if @discount != 0 
            @total = ((100 - @discount) / 100.0 * @total)
            return "After the discount, the total comes to $#{@total.to_i}."
        else    
            return "There is no discount to apply."
        end    
    end

    def void_last_transaction
        @total -= @last_transaction
    end
end
