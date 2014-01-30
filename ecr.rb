#require 'rubygems'
#require 'serialport'
require "../serialport.so"

def ComInit( config )
	begin
		puts(config)
		file = open(config,"r")
		line = file.readline
		puts(line)
		line = file.readline
		puts(line)
		line = file.readline
		puts(line)
		line = file.readline
		puts(line)
		line = file.readline
		puts(line)
	rescue
		puts("Can not read config file")		
		nil   # �L�k�g�J�ɮסH���N���Ǧ^�r��
	ensure
		file.close   # ... �o�`�O�|�o�ͪ��C		
	end
end

def ReadRequestData( filename )
	begin
		puts(filename)
		file = open(filename,"r")
		info = file.readline
		info  # �̫�p�⪺���e���Ǧ^��
	rescue
		puts("Can not read file")		
		nil   # �L�kŪ���ɮסH���N���Ǧ^�r��
	ensure
		file.close   # ... �o�`�O�|�o�ͪ��C		
	end
end

def SaveResponseData( filename ,data)
	begin
		puts(filename)
		file = open(filename,"w")
		info = file.write(data)
		info  # �̫�p�⪺���e���Ǧ^��
	rescue
		puts("Can not write file")		
		nil   # �L�k�g�J�ɮסH���N���Ǧ^�r��
	ensure
		file.close   # ... �o�`�O�|�o�ͪ��C		
	end
end



puts("Filetest")
puts(" ")
puts("FileRead")
puts(ReadRequestData("TestData.dat"))
puts("readend")
puts("FileWrite")
puts(SaveResponseData("TestWriteData.dat","I am stupid person"))
puts("writeend")

ComInit("EcrDat.dat")

puts("end")

__END__