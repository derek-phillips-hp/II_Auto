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
			wyoming:       '//*[@id="select2-results-4"]/li[51]',
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
			pgsSaveAndContinue:    '//*[@id="save-and-continue"]',
			sfAddPrepaidCard:      '//*[@id="prepaid-add"]',
			sfNameOnCard:          '//*[@id="billing_form_content"]/div[1]/div[2]/div/input',
			sfCardNumber:          '//*[@id="billing_form_content"]/div[1]/div[3]/div/input',
			sfExpirationDropDown:  '//*[@id="s2id_autogen1"]/a',
			sf_12th_month:         '//*[@id="select2-results-2"]/li[13]',
			sfYearDropDown:        '//*[@id="s2id_autogen3"]/a',
			sf_Year_2034:          '//*[@id="select2-results-4"]/li[21]',
			sfCVV:                 '//*[@id="billing_form_content"]/div[1]/div[7]/div[1]/input',
			sfSameAsShipping:      '//*[@id="billing_form_content"]/div[2]/div[2]/div/div/label',
			sfPhoneNumber:         '//*[@id="billing_form_content"]/div[2]/div[7]/div/input',
			sfSaveAndContinue:     '//*[@id="billing_form_confirm_btn_box"]/div/span/button[2]'
		},
		reviewPage:{
			planText:           '/html/body/div[6]/div/div[3]/div/div[1]/ol/li[1]/div[2]',
			shippingText:       '/html/body/div[6]/div/div[3]/div/div[1]/ol/li[3]/div[2]',
			billingCCText:      '//*[@id="billing-info"]/div[1]',
			billingAddressText: '//*[@id="billing-info"]/div[2]',
			promoCode:          '//*[@id="promotion"]',
			promoApply:         '/html/body/div[6]/div/div[3]/div/div[1]/ol/li[5]/div[2]/div/span/input[2]',
			promoAccepted:      '/html/body/div[6]/div/div[3]/div/div[1]/ol/li[5]/div[2]/div/div/div/div[2]',
			enrollmentKeyInfo:  '/html/body/div[6]/div/div[3]/div/div[1]/ol/li[6]/div[2]/div/table[1]/tbody[1]/tr[2]',
			promoCodeInfo:      '/html/body/div[6]/div/div[3]/div/div[1]/ol/li[6]/div[2]/div/table[1]/tbody[3]/tr[1]',
			tosCheckBox:        '//*[@id="subscription_accepted_terms_and_conditions"]',
			enroll:             '//*[@id="enroll-button"]'

		},
		thankyouPage:{
			progressBar:     '//*[@id="cloud-kick-wait-modal"]/div',
			viewAccountPage: '//*[@id="dashboard-button"]'
		},
		dashboard:{
			signOut: '//*[@id="logout"]',

			statusInfo:    '//*[@id="printer-status"]',
			enrolledPlan:  '//*[@id="printer-status"]/ul/li[4]',
			accountNumber: '//*[@id="printer-status"]/ul/li[5]/span',

			shippingBilling: '/html/body/div[6]/div/div/div[4]/div[1]',
			
			shippingInfo:       '//*[@id="shipping-info"]/div[1]',
			editShipping:       '//*[@id="shipping-info"]/div[2]/a',
			editFirstName:      '//*[@id="billing_form_content"]/div[1]/div[1]/div/input',
			editLastName:       '//*[@id="billing_form_content"]/div[1]/div[2]/div/input',
			editShippingSave:   '//*[@id="billing_form_confirm_btn_box"]/div/span/button[2]',
			editShippingCancel: '//*[@id="billing_form_confirm_btn_box"]/div/span/button[1]',
			
			editBilling: '//*[@id="edit-credit-card"]',
			billingInfo: '//*[@id="payment-info"]',
                     
			myPlan:           '/html/body/div[6]/div/div/div[5]',
			planInfo:         '//*[@id="outer-my-plan-content"]/div/table/tbody/tr[2]/td/div',
			editPlan:         '//*[@id="outer-my-plan-content"]/div/table/tbody/tr[1]/td/table/tbody/tr/td[2]/a',
			planOne:          '//*[@id="plan-1-input"]',
			planTwo:          '//*[@id="plan-2-input"]',
			planThree:        '//*[@id="plan-3-input"]',
			changePlan:       '//*[@id="edit-plan-modal"]/div/div/div/div[3]/a[1]',
			cancelPlanChange: '//*[@id="edit-plan-modal"]/div/div/div/div[3]/a[2]',

			printingHistory: '/html/body/div[6]/div/div/div[6]',

			activity:   '/html/body/div[6]/div/div/div[7]',
			firstEntryDescription: '//*[@id="activity-content"]/table/tbody/tr/td[2]',

			support:                    '/html/body/div[6]/div/div/div[8]',
			cancelEnrollment:           '//*[@id="support-content"]/div/div[1]/div[3]/a',
			cancelEnrollmentBlueButton: '//*[@id="cancel-enrollment-modal"]/div/div/div/div[3]/a[1]',
			keepEnrollment:             '//*[@id="cancel-enrollment-modal"]/div/div/div/div[3]/a[2]'
		}
	}

	def getXpath( page, id_name)
		return MAP[page][id_name]
	end

end