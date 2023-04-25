ip -4 addr | grep "^.*inet" | awk '{print $2}' | grep -v "^127" | awk -F'/' '{print $1}'
