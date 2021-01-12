class Application 

    # @@item = [Item.new("Apple", 46)]

    def call(env)
        resp = Rack::Response.new
        req = Rack::Request.new(env)

        if req.path.match(/items/)
            searched_item =  req.path.split("/items/").last
            if item = @@items.find{|i| i.name == searched_item}
                resp.write item.price
            elsif
                resp.status = 400
                resp.write "Item not found"
            end
        elsif
            resp.status = 404
            resp.write "Route not found"
        end


        resp.finish
    end

end