module Commands
  def genssh(argv)
    app_id = argv.shift
    
    #return false if app_id.nil?
    
    phpfog = PHPfog.new
    #puts "What is your email address?" 
    ENV['SSHKEY'] = phpfog.username
    shell_script = IO.popen(get_script_path("genssh.sh"))   
    ssh_key=nil
    while shell_script.gets do
      ssh_key=$_
      $_
    end
    shell_script.close
    if /^ssh-rsa/.match( ssh_key ) 
      phpfog.new_sshkey("",ssh_key)
      repo_addr=SSHKEY.gsub!(".", "-")
      puts "Key successfully added"
      puts "To clone your repo run git clone $repo_addr"
    end
    true
  end
end
