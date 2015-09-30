module Map

	MAP = {
		landingPage:{
			signUpBlueButton: '/html/body/div[6]/div/div[3]/div[2]/div[4]/div/a'
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
			printerAdded: '//*[@id="signup-step-two"]/div[3]/form/div[1]/ul/li/label/div',
			contune:      '//*[@id="signup-step-two"]/div[3]/form/div[2]/input'
		},
		shippingPage:{

		},
		billingPage:{

		},
		reviewPage:{

		},
		thankyouPage:{

		},
		dashboard:{

		}

	}

	def getXpath( page, id_name)
		return MAP[page][id_name]
	end

end