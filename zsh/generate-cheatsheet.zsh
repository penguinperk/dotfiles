#!/usr/bin/env zsh

# ZSH Aliases & Functions Cheatsheet Generator
# Generates a markdown cheatsheet from aliases.zsh

ALIASES_FILE="$HOME/.config/dotfiles/zsh/aliases.zsh"
OUTPUT_FILE="$HOME/.config/dotfiles/zsh/cheatsheet.md"

# Function to generate the cheatsheet
generate_cheatsheet() {
    local current_section=""
    local temp_file=$(mktemp)
    
    echo "# ZSH Aliases & Functions Cheatsheet" > "$temp_file"
    echo "" >> "$temp_file"
    echo "*Auto-generated from aliases.zsh*" >> "$temp_file"
    echo "" >> "$temp_file"
    
    # Process the aliases file line by line
    while IFS= read -r line; do
        # Handle section headers (lines starting with #)
        if [[ "$line" =~ ^#[[:space:]]*[A-Za-z] ]]; then
            current_section=$(echo "$line" | sed 's/^#[[:space:]]*//')
            if [[ -n "$current_section" ]]; then
                echo "## $current_section" >> "$temp_file"
                echo "" >> "$temp_file"
            fi
        
        # Handle aliases
        elif [[ "$line" =~ ^alias[[:space:]] ]]; then
            local alias_def=$(echo "$line" | sed 's/^alias[[:space:]]*//')
            local alias_name=$(echo "$alias_def" | cut -d'=' -f1)
            local alias_cmd=$(echo "$alias_def" | cut -d'=' -f2- | sed "s/^['\"]//; s/['\"]$//")
            echo "- \`$alias_name\` → \`$alias_cmd\`" >> "$temp_file"
        
        # Handle functions
        elif [[ "$line" =~ ^[a-zA-Z][a-zA-Z0-9_-]*\(\)[[:space:]]*\{ ]]; then
            local func_name=$(echo "$line" | sed 's/()[[:space:]]*{.*//')
            echo "- \`$func_name()\` - *function*" >> "$temp_file"
        
        elif [[ "$line" =~ ^[a-zA-Z][a-zA-Z0-9_-]*\(\) ]]; then
            local func_name=$(echo "$line" | sed 's/().*//')
            echo "- \`$func_name()\` - *function*" >> "$temp_file"
        
        elif [[ "$line" =~ ^function[[:space:]]+[a-zA-Z] ]]; then
            local func_name=$(echo "$line" | sed 's/^function[[:space:]]*//; s/()[[:space:]]*{.*//')
            echo "- \`$func_name()\` - *function*" >> "$temp_file"
        fi
        
    done < "$ALIASES_FILE"
    
    # Add special sections for better organization
    echo "" >> "$temp_file"
    echo "## Quick Reference" >> "$temp_file"
    echo "" >> "$temp_file"
    echo "### Most Used Commands" >> "$temp_file"
    echo "- \`k\` → kubectl" >> "$temp_file"
    echo "- \`tf\` → terraform" >> "$temp_file"
    echo "- \`vim/vi\` → nvim" >> "$temp_file"
    echo "- \`co\` → copilot (quick commands)" >> "$temp_file"
    echo "- \`sourceme\` → reload zsh config" >> "$temp_file"
    echo "" >> "$temp_file"
    
    echo "### Copilot Functions" >> "$temp_file"
    echo "- \`co()\` - Quick day-to-day CLI commands (gpt-5-mini)" >> "$temp_file"
    echo "- \`coi()\` - Interactive / quick DevOps prompts (gpt-4.1-mini, --allow-all)" >> "$temp_file"
    echo "- \`co-code()\` - Code-heavy tasks / Terraform / YAML (gpt-5.1-codex)" >> "$temp_file"
    echo "- \`co-heavy()\` - Deep architecture, SOC design, or large-scale reasoning (gpt-5)" >> "$temp_file"
    echo "- \`co-list()\` - Show copilot function descriptions" >> "$temp_file"
    echo "" >> "$temp_file"
    
    echo "### Azure Functions" >> "$temp_file"
    echo "- \`azgetvm <VM_NAME>\` - Get VM power state" >> "$temp_file"
    echo "- \`azvmriv2()\` - List VMs with detailed info" >> "$temp_file"
    echo "- \`azip_public <IP>\` - Check if IP is Azure public IP" >> "$temp_file"
    echo "- \`azip_private <IP>\` - Check if IP is Azure private IP" >> "$temp_file"
    echo "" >> "$temp_file"
    
    echo "---" >> "$temp_file"
    echo "*Generated on: $(date)*" >> "$temp_file"
    
    # Move temp file to final location
    mv "$temp_file" "$OUTPUT_FILE"
    
    echo "✅ Cheatsheet generated: $OUTPUT_FILE"
    echo "📖 Open with: md $OUTPUT_FILE"
}

# Create an alias for easy access
create_alias() {
    local alias_line='alias cheat="generate-cheatsheet.zsh && md ~/.config/dotfiles/zsh/cheatsheet.md"'
    
    if ! grep -q "alias cheat=" "$ALIASES_FILE"; then
        echo "" >> "$ALIASES_FILE"
        echo "# Cheatsheet" >> "$ALIASES_FILE"
        echo "$alias_line" >> "$ALIASES_FILE"
        echo "✅ Added 'cheat' alias to aliases.zsh"
        echo "💡 Run 'sourceme' to reload, then use 'cheat' command"
    else
        echo "ℹ️  'cheat' alias already exists"
    fi
}

# Main execution
main() {
    echo "🔧 Generating ZSH cheatsheet..."
    generate_cheatsheet
    create_alias
    echo ""
    echo "🎉 Done! Use 'cheat' command after reloading zsh"
}

# Run if executed directly
if [[ "${BASH_SOURCE[0]}" == "${0}" ]] || [[ "$0" == *"generate-cheatsheet.zsh" ]]; then
    main "$@"
fi