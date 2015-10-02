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
			pgsEnterCreditCard:    '//*[@id="pgs-credit-card"]/div[2]/a',
			pgsFirstName:          '//*[@id="first-name"]',
			pgsLastName:           '//*[@id="last-name"]',
			pgsCardNumber:         '//*[@id="credit-card-number"]',
			pgsExpirationDropDown: '//*[@id="card-month"]',
			pgs_12th_month:        '//*[@id="card-month"]/option[13]',
			pgsYearDropDown:       '//*[@id="card-year"]',
			pgs_Year_2030:         '//*[@id="card-year"]/option[17]',
			pgsCVV:                '//*[@id="cvv"]',
			pgsPhoneNumber:        '//*[@id="phone"]',
			pgsContinue:           '//*[@id="continue-button"]',
			sfAddPrepaidCard:      '//*[@id="prepaid-add"]',
			sfNameOnCard:          '//*[@id="billing_form_content"]/div[1]/div[2]/div/input',
			sfCardNumber:          '//*[@id="billing_form_content"]/div[1]/div[3]/div/input',
			sfExpirationDropDown:  '//*[@id="s2id_autogen1"]/a',
			sf_12th_month:         '//*[@id="billing_form_content"]/div[1]/div[5]/div/div/select[1]/option[13]',
			sfYearDropDown:        '//*[@id="s2id_autogen3"]/a',
			sf_Year_2034:          '//*[@id="billing_form_content"]/div[1]/div[5]/div/div/select[2]/option[21]',
			sfCVV:                 '//*[@id="billing_form_content"]/div[1]/div[7]/div[1]/input'
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