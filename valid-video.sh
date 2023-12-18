file="./link.txt"
output_file="./output.txt"

while read -r line; do
    echo "$line"

    response=$(curl -Is "$line" | head -n 1)
    status=$(echo "$response" | cut -d' ' -f2)

    if [ "$status" -eq 200 ]; then
        video_status="$status"
        video_msg="Working"
        echo "$line" >> "$output_file"
        echo "$video_msg" >> "$output_file"
        echo >> "$output_file"  # Add a line break
    else
        video_status="404"
        video_msg="Invalid URL or Empty URL"
        echo "$line" >> "$output_file"
        echo "$video_msg" >> "$output_file"
        echo >> "$output_file"  # Add a line break
    fi

done < "$file"