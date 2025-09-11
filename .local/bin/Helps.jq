#!/bin/sh

JSON="/private/var/mobile/Library/Mobile Documents/com~apple~CloudDocs/sharedlocal/myconfigs/databases/json"

i=1
for category in $categories; do
	echo "$i) $category"
	eval "cat_$i='$category'"
	i=$((i+1))
done

echo "Choose a category (number):"
read category_num
chosen_category=$(eval "\$cat_$category_num")
if [ -z "$chosen_category" ]; then
	echo "Invalid category number."
exit 1
fi

i=1
for item in $items; do
	echo "&1) $item"
	eval "item_$i='$item'"
	i=$((i+1))
done

echo "Choose a item (number):"
read item_num
chosen_item=$(eval echo "\$item_$item_num")
if [ -z "$chosen_item" ]; then
	echo "Invalid category number."
exit 1
fi

value=$(jq -r --arg category "$chosen_category" --arg item "$chosen_item" '.[$category][$item]' "$JSON")
echo "Result: $value"
