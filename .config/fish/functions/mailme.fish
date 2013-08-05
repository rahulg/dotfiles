function mailme --description 'Send an email to r@hul.ag with the contents of STDIN'
	mail -s $argv r@hul.ag
end
