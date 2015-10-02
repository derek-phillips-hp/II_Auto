module II_Map

	MAP = {
		landingPage:{
			signUpBlueButton: '/html/body/div[6]/div/div[3]/div[2]/div[4]/div/a',
			signInNavBar:     '//*[@id="login"]',
			signInEmail:      '//*[@id="signinEmail"]',
			signInPassword:   '//*[@id="signinPassword"]',
			signInSubmit:     '//*[@id="signinSubmit"]'
		},
		signInPage:{
			signupEmail:     '//*[@id="signupEmail"]',
			firstName:       '//*[@id="firstName"]',
			lastName:        '//*[@id="lastName"]',
			password:        '//*[@id="password"]',
			confirmPassword: '//*[@id="confirmPassword"]',
			signupSubmit:    '//*[@id="signupSubmit"]',
			yesItsCorrect:   '/html/body/div[5]/div[2]/a'
		},
		planPage:{
			enrollCode:         '//*[@id="code"]',
			apply:              '//*[@id="code-form"]/div[1]/input[2]',
			planOneRaidoButton: '//*[@id="plan-1-input"]',
			continue:           '//*[@id="signup-step-one"]/div[3]/div[2]/a[2]'
		},
		printerPage:{
			claimCode:    '//*[@id="code"]',
			add:          '//*[@id="add-printer-box"]/div/div/div/div[3]/a[2]',
			cancel:       '//*[@id="add-printer-box"]/div/div/div/div[3]/a[1]',
			localPrinter: '//*[@id="signup-step-two"]/div[3]/form/div[1]/p[3]/a',
			printerAdded: '//*[@id="signup-step-two"]/div[3]/form/div[1]/ul/li/label/div',
			continue:     '//*[@id="signup-step-two"]/div[3]/form/div[2]/input'
		},
		shippingPage:{
			streetAddress: '//*[@id="billing_form_content"]/div[2]/div[1]/div/input',
			city:          '//*[@id="billing_form_content"]/div[2]/div[3]/div/input',
			stateDropDpwn: '//*[@id="s2id_autogen3"]/a',
			california:    '//*[@id="select2-results-4"]/li[6]',
			zipCode:       '//*[@id="billing_form_content"]/div[2]/div[4]/div/input[1]',
			continue:      '//*[@id="saveUpdate"]'
		},
		billingPage:{

		},
		reviewPage:{

		},
		thankyouPage:{

		},
		dashboard:{
			shippingBilling: '/html/body/div[6]/div/div/div[4]/div[1]',
			editShipping:    '//*[@id="shipping-info"]/div[2]/a',
			stateDropDpwn:   '//*[@id="select2-drop"]'
		}

	}

	def getXpath( page, id_name)
		return MAP[page][id_name]
	end

end