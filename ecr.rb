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
		nil   # 無法寫入檔案？那就不傳回字串
	ensure
		file.close   # ... 這總是會發生的。		
	end
end

def ReadRequestData( filename )
	begin
		puts(filename)
		file = open(filename,"r")
		info = file.readline
		info  # 最後計算的內容為傳回值
	rescue
		puts("Can not read file")		
		nil   # 無法讀取檔案？那就不傳回字串
	ensure
		file.close   # ... 這總是會發生的。		
	end
end

def SaveResponseData( filename ,data)
	begin
		puts(filename)
		file = open(filename,"w")
		info = file.write(data)
		info  # 最後計算的內容為傳回值
	rescue
		puts("Can not write file")		
		nil   # 無法寫入檔案？那就不傳回字串
	ensure
		file.close   # ... 這總是會發生的。		
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