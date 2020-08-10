class AttendanceMailer < ApplicationMailer
  default from: 'keke93@yopmail.com'
 
  def attendance_email(attendance)
    #on récupère l'instance@attendance pour ensuite pouvoir la passer à la view en @attendance
    @attendance = attendance 

    #on définit une variable @url qu'on utilisera dans la view d’e-mail
    @url  = 'http://monsite.fr/login' 

    # c'est cet appel à mail() qui permet d'envoyer l’e-mail en définissant destinataire et sujet.
     mail(to: @attendance.guest.email, subject: 'Tu es bien inscris') 
  end
end
