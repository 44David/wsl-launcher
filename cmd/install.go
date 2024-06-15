/*
Copyright © 2024 NAME HERE <EMAIL ADDRESS>

*/
package cmd

import (
	"fmt"
	"github.com/spf13/cobra"
	"os/exec"
	"log"
	"strings"
)

// installCmd represents the install command
var installCmd = &cobra.Command{
	Use:   "install",
	Short: "installs linux distro specified",
	Long: `The install command will download the specified distro.
			Use: wsldwnl install Debian`,

	Run: func(cmd *cobra.Command, args []string) {
		if args[0] == "arch" {
			fmt.Println("Installing...")
			archBatchFile := `bin\arch.bat`
			execCommand := exec.Command(archBatchFile)
			
			output, err := execCommand.CombinedOutput()
			if err != nil {
				log.Fatal("Failed to execute batch file. Error: &v", err)
			}

			log.Printf("Output:\n %s", string(output))
			
			var response string
			fmt.Print("Would you like to boot the system now? [Y/n]")
			fmt.Scan(&response)



		}

		if args[0] == "debian" && args[1] == "dev" {	
			fmt.Println("Installing...")
			execScript := `sh debian-create-targz.sh dev`
			execCommand := exec.Command(execScript)
			
			output, err := execCommand.CombinedOutput()
			if err != nil {
				log.Fatal("Failed to execute installation script. Error: &v", err)
			}

			log.Printf("Output:\n %s", string(output))

			var response string
			fmt.Print("Would you like to boot the system now? [Y/n]")
			fmt.Scan(&response)
			resUpper := strings.ToUpper(response)
			if resUpper == "Y" {
				bootScript := `sh boot-distro.sh`
				exec.Command(bootScript)
			}
		}

	},
}

func init() {
	rootCmd.AddCommand(installCmd)

	// Here you will define your flags and configuration settings.

	// Cobra supports Persistent Flags which will work for this command
	// and all subcommands, e.g.:
	// installCmd.PersistentFlags().String("foo", "", "A help for foo")

	// Cobra supports local flags which will only run when this command
	// is called directly, e.g.:
	// installCmd.Flags().BoolP("toggle", "t", false, "Help message for toggle")
}
