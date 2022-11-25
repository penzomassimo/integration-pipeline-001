
hello:
	echo "Hello, World"



cleanup_assets:
	find ./assets/diagrams -type f -iname '.*' -exec rm {} \;
	find ./assets/images -type f -iname '.*' -exec rm {} \; 
