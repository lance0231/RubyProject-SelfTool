#require 'rubygems'
#require "serialport"
#require "../serialport.so"
require "socket"

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
		file.close   # ... �T�w�@�w�n����	
	end
end

def TcpSeverInit
	begin
		port = 8080
		server = TCPServer.new("0.0.0.0",port)
		loop{
			puts("connecting...")
			Thread.fork(server.accept){|sock|
			begin
				#puts("connecting...")
			ensure
				sock.close unless sock.closed?
			end
			}
		}
	rescue
		puts("Create TCP Server Fail")		
		nil  
	ensure
		# ... �T�w�@�w�n����		
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
		file.close   # �T�w�@�w�n����	
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
		file.close   # �T�w�@�w�n����	
	end
end



puts("File test")
puts(" ")
puts("FileRead")
puts(ReadRequestData("TestData.dat"))
puts("read end")
puts("FileWrite")
puts(SaveResponseData("TestWriteData.dat","I am a stupid person"))
puts("write end")

ComInit("EcrDat.dat")

TcpSeverInit()

puts("end")

__END__