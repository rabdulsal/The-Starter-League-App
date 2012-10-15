require 'open-uri'

	class SectionsController < ApplicationController
		def am_section
			@response = open("http://codemountain.com/api/students/am.json").read
	    	@students = JSON.parse(@response)	    
		end

		def pm_section		
			@response = open("http://codemountain.com/api/students/pm.json").read
			@students = JSON.parse(@response)
		end

		def rfd_section		
			@response = open("http://codemountain.com/api/students/rfd.json").read
			@students = JSON.parse(@response)
		end

		def tsl_class
			@response1 = open("http://codemountain.com/api/students/rfd.json").read			
			@students_am = JSON.parse(@response1)

			@response2 = open("http://codemountain.com/api/students/pm.json").read
			@students_pm = JSON.parse(@response2)

			@response3 = open("http://codemountain.com/api/students/am.json").read
			@students_rfd = JSON.parse(@response3)

			@tsl_class_2012 = [@students_am, @students_pm, @students_rfd]
		end

	end
