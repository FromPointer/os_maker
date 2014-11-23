

clear:
	rm -rf *.*~ *~
	find . -name "*.*~" | awk '{print $0}' | xargs rm -rf
	find . -name "*.bin" | awk '{print $0}' | xargs rm -rf
	find . -name "*.o" | awk '{print $0}' | xargs rm -rf 
	find . -name "*.dis" | awk '{print $0}' | xargs rm -rf
