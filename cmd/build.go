/*
Copyright © 2024 NAME HERE <EMAIL ADDRESS>
*/
package cmd

import (
	"fmt"
	"log"
	"os/exec"
	"path/filepath"

	"github.com/spf13/cobra"
)

// buildCmd represents the build command
var buildCmd = &cobra.Command{
	Use:   "build",
	Short: "Usage: wsldwnl build [NAME] [INSTALL.TAR.GZ]",
	Long:  `Used to build a custom distro using a rootfs tarball.`,
	Run: func(cmd *cobra.Command, args []string) {

		if len(args) < 1 {
			fmt.Printf("Please provide the installation medium.\n")
			fmt.Printf(`Usage: wsldwnl build [INSTANCE NAME] ["DISTRO.TAR.GZ"]`)
			log.Fatal()
		}

		distro_name := args[0]
		file := args[1]

		switch filepath.Ext(file) {
			case ".gz", ".vhdx", ".tar": 
				cmd := exec.Command("wsl", "bash", "-c", "/distro-builder/build-custom.sh", distro_name, file)
				err := cmd.Run() 
				if err != nil {
					log.Fatal(err)
				}
			case ".iso":
				cmd := exec.Command("wsl", "bash", "-c", "/distro-builder/build-iso.sh", distro_name, file)
				err := cmd.Run() 
				if err != nil {
					log.Fatal(err)
				}
			default: 
				fmt.Printf("Sorry, could not read file. Are you sure it's an accepted file type?")
		}
		

	},
}

func init() {
	rootCmd.AddCommand(buildCmd)

	// Here you will define your flags and configuration settings.

	// Cobra supports Persistent Flags which will work for this command
	// and all subcommands, e.g.:
	// buildCmd.PersistentFlags().String("foo", "", "A help for foo")

	// Cobra supports local flags which will only run when this command
	// is called directly, e.g.:
	// buildCmd.Flags().BoolP("toggle", "t", false, "Help message for toggle")
}
