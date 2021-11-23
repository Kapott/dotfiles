function fixaudio -d 'Try everything, see what sticks.'
	pulseaudio -k && pulseaudio --start
end
