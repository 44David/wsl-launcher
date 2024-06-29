/*
Copyright © 2024 NAME HERE <EMAIL ADDRESS>
*/
package cmd

import (
	"fmt"
	"os/exec"
	// "bytes"
	"strings"
	"github.com/manifoldco/promptui"
	"github.com/spf13/cobra"
)

// listCmd represents the list command
var listCmd = &cobra.Command{
	Use:   "list",
	Short: "Manage installed distros",
	Long: `Delete, edit or view all installed WSL2 instances.`,
	Run: func(cmd *cobra.Command, args []string) {

		out, err := exec.Command("wsl", "-l").Output()

		if err != nil {
			fmt.Printf("Sorry, an error occured. %v\n", err)
			return 
		}

		outString := string(out)

		lines := strings.Split(outString, "\r\n")
		
		var installed_distros []string
		for _, line := range lines {
			if line != "" {
				fmt.Println(line)
				installed_distros = append(installed_distros, line)
			}
		}

		fmt.Println(installed_distros)


		prompt := promptui.Select{
			Label: "Installed WSL Instances",
			Items: installed_distros,
		}

		_, result, err := prompt.Run()

		if err != nil {
			fmt.Printf("Execution Failed with error %v\n", err)
			return
		}

		println(result)
		

	},
}

func init() {
	rootCmd.AddCommand(listCmd)

	// Here you will define your flags and configuration settings.

	// Cobra supports Persistent Flags which will work for this command
	// and all subcommands, e.g.:
	// listCmd.PersistentFlags().String("foo", "", "A help for foo")

	// Cobra supports local flags which will only run when this command
	// is called directly, e.g.:
	// listCmd.Flags().BoolP("toggle", "t", false, "Help message for toggle")
}
