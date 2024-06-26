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
			fmt.Printf("Please provide the directory to a your tarball\n")
			fmt.Printf(`Usage: wsldwnl build [INSTANCE NAME] ["DISTRO.TAR.GZ"] [DESTINATION FOLDER NAME]`)
			log.Fatal()
		}

		distro_name := args[0]
		file := args[1]
		destination_folder := args[2]


		if filepath.Ext(file) == ".gz" {
			exec.Command("bash distro-builder/build-custom.sh %v %v %v", distro_name, file, destination_folder)
		} else {
			fmt.Printf("Please provide a valid rootfs tar.gz distro.")
			
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
