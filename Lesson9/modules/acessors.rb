module Acessors

	def attr_accessor_with_history(*args)
		args.each do |arg|
			var_name = "@#{arg}".to_sym
			var_name_history = "@#{arg}_history".to_sym

			define_method(arg) do
				instance_variable_get(var_name)
			end

			define_method("#{arg}=") do |value|
				instance_variable_set(var_name, value)
				if !instance_variable_get(var_name_history)
					instance_variable_set(var_name_history, [])
				end
				instance_variable_set(var_name_history, instance_variable_get(var_name_history).push(value))
			end

			define_method("#{arg}_history") do
				instance_variable_get(var_name_history)
			end

		end
	end

	def strong_attr_acessor(attr_name, type)
		if attr_name.type.is_a(type)
	end

end
