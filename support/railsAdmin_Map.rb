module RailsAdmin_Map

	MAP = {
		printerCreation:{
			serialNumber:           '//*[@id="printer_serial"]',
			deviceImmutableId:      '//*[@id="printer_device_immutable_id"]',
			cloudPrinterIdentifier: '//*[@id="printer_cloud_identifier"]',
		},
	}

	def getRailsXpath( page, id_name)
		return MAP[page][id_name]
	end

end