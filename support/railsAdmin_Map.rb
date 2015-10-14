module RailsAdmin_Map

	MAP = {
		geminiAdmin:{
			userName: '//*[@id="admin_email"]',
			password: '//*[@id="admin_password"]',
			logIn:    '//*[@id="new_admin"]/div[3]/input'
		},
		agenaAdmin:{
			userName: '//*[@id="admin_user_email"]',
			password: '//*[@id="admin_user_password"]',
			logIn:    '//*[@id="new_admin_user"]/div[4]/input'
		},
		printerCreation:{
			serialNumber:           '//*[@id="printer_serial"]',
			deviceImmutableId:      '//*[@id="printer_device_immutable_id"]',
			cloudPrinterIdentifier: '//*[@id="printer_cloud_identifier"]',
			addPrinter:             '//*[@id="new_printer"]/input[3]'
		},
		redeemEK:{
			unRedeem:         '/html/body/div[2]/div/div[2]/div/ul/li[4]/a',
			unRedeemResult:   '/html/body/div[2]/div/div[2]/div/div[2]'
		},
		obsoleteSub:{
			obsolete: '/html/body/div[2]/div/div[2]/div[2]/div/a[1]',
			status:   '/html/body/div[2]/div/div[2]/div/div[2]/dl/dd[4]'
		},
		subscription_query:{
			id_link: '//*[@id="bulk_form"]/table/tbody/tr/td[2]/a'
		},
		subscription_edit:{
			printer_contacted: '//*[@id="subscription_printer_contacted"]',
			page_count:        '//*[@id="subscription_subscription_page_count_during_first_contact"]',
			event_shift:       '//*[@id="subscription_rollback"]',
			state:             '//*[@id="subscription_state_event"]',
			trans_to_sub:      '//*[@id="subscription_state_event"]/option[3]',
			save_and_exit:     '//*[@id="edit_subscription"]/div/div/button'
		}
	}

	def getRailsXpath( page, id_name)
		return MAP[page][id_name]
	end

end