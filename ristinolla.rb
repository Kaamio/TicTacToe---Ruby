class Peli
		
	attr_accessor :sijainti, :ruudut, :pelaaja1, :pelaaja2, :voitto
  
  def initialize(pelaaja1, pelaaja2)
  	@pelaaja1 = pelaaja1
  	@pelaaja2 = pelaaja2  	  	
  	@ruudut = ["0", "1", "2", "3", "4", "5", "6", "7", "8"]  	
  	@p1vuoro = true
  	@voitto = false
  end

  def tarkistaVoitto
  	@voittavat = [ [ @ruudut[0],@ruudut[1],@ruudut[2] ] ,[@ruudut[3],@ruudut[4],@ruudut[5]],[@ruudut[6],@ruudut[7],@ruudut[8]],[@ruudut[0],@ruudut[3],@ruudut[6]], [@ruudut[1],@ruudut[4],@ruudut[7]],[@ruudut[2],@ruudut[5],@ruudut[8]],[@ruudut[2],@ruudut[4],@ruudut[6]], [@ruudut[0],@ruudut[4],@ruudut[8]] ]
  	for i in 0...@voittavat.size
  		if @p1vuoro == true
  		  if @voittavat[i].all? {|s| s== @pelaaja1.symboli } 
  	  puts "Voittajaksi selviytyi Pelaaja 1!"	
   	 @voitto = true
   			end
  		end 
  			if @voittavat[i].all? {|s| s== @pelaaja2.symboli }
  		puts "Voittajaksi selviytyi Pelaaja 2!"	
   	 @voitto = true
   	 end	
    end
end

   def tarkista(siirto)
   	
   	if siirto.to_s.match(/[^0-8]/)
   	 puts "Valitse numero väliltä 0-8!"
   	 return false 
   	end
	   
	if @ruudut[siirto.to_i] == @pelaaja1.symboli || @ruudut[siirto.to_i] == @pelaaja2.symboli
	puts "Ruutu on jo käytetty! , anna toinen" + "\n"	
	else
	return true

	end   
  end

  def siirto(sijainti)
  	
  	if @p1vuoro == true 
  		@ruudut[sijainti.to_i] = @pelaaja1.symboli
  		tarkistaVoitto
  		@p1vuoro = false
  	else	
  	  @ruudut[sijainti.to_i] = @pelaaja2.symboli
  	  tarkistaVoitto 
  	  @p1vuoro=true
  	end
 		
  end

end


class Pelaaja
	attr_accessor :symboli

  def initialize(symboli)
  	@symboli = symboli
  	
  end
end



def tarkista(symboli)
	kirjaimet = ("A".."Z").to_a
  while !kirjaimet.include?(symboli)
	puts "Valitse kirjain! Ei numeroita!"
	symboli = gets.chomp.upcase
  end 
end



puts "Valitse symboli pelaaja 1\n"
symboli = gets.chomp.upcase
tarkista(symboli)
pelaaja1 = Pelaaja.new(symboli)

puts "Valitse symboli pelaaja 2\n"
symboli2 = gets.chomp.upcase
tarkista(symboli2)
pelaaja2 = Pelaaja.new(symboli2)


testipeli = Peli.new(pelaaja1, pelaaja2)

sijainti =""

puts "Peli alkaa!"
print "#{testipeli.ruudut[0]}"+"#{testipeli.ruudut[1]}"+"#{testipeli.ruudut[2]}\n"+"#{testipeli.ruudut[3]}"+"#{testipeli.ruudut[4]}"+"#{testipeli.ruudut[5]}\n""#{testipeli.ruudut[6]}"+"#{testipeli.ruudut[7]}"+"#{testipeli.ruudut[8]}\n"
while testipeli.voitto == false
  
	loop do 
		puts "Pelaaja 1 valitse ruutu\n" 
  	     sijainti = gets.chomp
  	     break if testipeli.tarkista(sijainti) == true
 	    end
 	 	testipeli.siirto(sijainti)
 	 	print "#{testipeli.ruudut[0]}"+"#{testipeli.ruudut[1]}"+"#{testipeli.ruudut[2]}\n"+"#{testipeli.ruudut[3]}"+"#{testipeli.ruudut[4]}"+"#{testipeli.ruudut[5]}\n""#{testipeli.ruudut[6]}"+"#{testipeli.ruudut[7]}"+"#{testipeli.ruudut[8]}\n"
 	unless testipeli.voitto == true
  loop do puts "Pelaaja 2 valitse ruutu\n"
  	     sijainti = gets.chomp
  	     break if testipeli.tarkista(sijainti) == true
    	end

 	testipeli.siirto(sijainti)

 	print "#{testipeli.ruudut[0]}"+"#{testipeli.ruudut[1]}"+"#{testipeli.ruudut[2]}\n"+"#{testipeli.ruudut[3]}"+"#{testipeli.ruudut[4]}"+"#{testipeli.ruudut[5]}\n""#{testipeli.ruudut[6]}"+"#{testipeli.ruudut[7]}"+"#{testipeli.ruudut[8]}\n"
end
end

