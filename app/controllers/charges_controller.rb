class ChargesController < ApplicationController

  @@event = Event.new

  def new
    
    @event = Event.find_by(price: params[:event])
    puts "alert "*10 
    puts @event.price
    puts "****" * 12
    @@event = @event
  end
  
  def create
    # Amount in cents
    @amount = 500
  
    customer = Stripe::Customer.create({
      email: params[:stripeEmail],
      source: params[:stripeToken],
    })
  
    charge = Stripe::Charge.create({
      customer: customer.id,
      amount: @amount,
      description: 'Rails Stripe customer',
      currency: 'usd',
    })
    puts "****" * 12
    a = Attendance.create(event: @@event ,guest:current_user , stripe_customer_id: "ahah")
    puts "****" * 12
    p a
    puts Attendance.all
    redirect_to root_path

  rescue Stripe::CardError => e
    flash[:error] = e.message
    redirect_to new_charge_path
  end

end
