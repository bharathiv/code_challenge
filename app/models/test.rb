class Test < ApplicationRecord

		def self.read_leads_json
		value = ""
		file = File.open("leads.json").each do |line|
	         value  += line
	     end
	     value
	end

	def self.read_expected_json
		value = ""
		file = File.open("expected.json").each do |line|
	         value  += line
	     end
	     value 
	end

	def self.convert_json_to_hash(value)
		JSON.parse(value)
	end

	def self.convert_to_expected_data_set
	    leads = read_leads_json
	    leads = convert_json_to_hash(leads)
	    expected_json = read_expected_json
	    expected_json = convert_json_to_hash(expected_json)
	    out_put = []
	    leads.each { |ele|
	    	data = {}
	    	lead = ele.values[0]
	       keys = lead.keys()
	       values = lead.values
	       matching_keys = keys & expected_json.keys
	       matching_values = values & expected_json.values
	       ele.values[0].each{|k,v|
	       data[k] = v  if matching_keys.include?(k)
	       data[expected_json.key(v)] = v  if matching_values.include?(v)
	       }
	       out_put << data
	    }
	  out_put
	end
end
