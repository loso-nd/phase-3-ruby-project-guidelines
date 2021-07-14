require_relative '../config/environment'
prompt = TTY::Prompt.new
current_user = nil

menu_choice = prompt.select('What\'s good?', ["Login", "Signup"])

if menu_choice === "Login"
    user_name = prompt.ask('Username:')
    password = prompt.mask('Password:')

    #find and set a current_user typed in to match a username & password in our a pateint instances in our seed list file

        current_user = Patient.all.find { |pat| pat.name === user_name && pat.password === password}

        puts "Yerr! #{current_user.name} Bienvenido!"

    doctor_choice = prompt.select("Select a doctor below: ", Doctor.all)
    # date_choice = prompt.select("Choose a date", [Date.parse("07132021"), Date.parse("07142021"), Date.parse("07152021")])
    date_choice = prompt.select("Choose a date", [Date.strptime("07/22/2021", "%m/%d/%Y"), Date.strptime("07/23/2021", "%m/%d/%Y"), Date.strptime("07/25/2021", "%m/%d/%Y")])

    appt_confirm = prompt.select("Like are you sure you want to book appt with #{doctor_choice} at #{date_choice}?", ["Yessir","Nah, I\'m Good Luv, Enjoy!"])

    if appt_confirm === "Yessir"
        Appointment.create(doctor_id: doctor_choice.id, patients_id: current_user.id, date: date_choice)
        puts "Your appointment has been book"

    else 
        prompt.ask( "Why are you here, then?" )
    end
end

# puts "HELLO WORLD"
# puts Doctor.all.map { |doc| doc.name}