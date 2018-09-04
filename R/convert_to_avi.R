convert_to_avi<-function(){
  #Define some variables
    working.directory<-file.path(path.expand("~"),"Convert_to_AVI")
  
  #Set Working Directory to Video Location
    setwd(file.path(working.directory,"Source"))
  
  #What files do you want to convert?
    filelist<-list.files(pattern="\\.m2ts$")
  
  #Show some progress
    pb<- txtProgressBar(min=0,max=length(filelist),style=3)
    setTxtProgressBar(pb,0)  
    
    #Begin Loop
      for(i in 1:length(filelist)){
        #Process filename. Determine the extension and extract the start time.
          output.filename<-file.path(path.expand("~"),"Convert_to_AVI","Output",paste0(gsub(pattern = ".m2ts",replacement = "",x = filelist[i]),".avi"))
      
        #Construct ffmpeg command and pass to system
          ffmpeg.command<-paste0("ffmpeg -i ",filelist[i], " -deinterlace -qscale 0 ", output.filename)
          system(ffmpeg.command)
          setTxtProgressBar(pb,i)
    }
}