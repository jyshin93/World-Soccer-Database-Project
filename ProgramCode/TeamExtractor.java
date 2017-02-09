package codingChallenge;

import java.io.BufferedReader;
import java.io.FileNotFoundException;
import java.io.FileReader;
import java.io.BufferedWriter;
import java.io.FileWriter;
import java.io.File;
import java.io.IOException;
import java.util.HashMap;
import java.util.Scanner;
import java.util.SortedSet;
import java.util.TreeSet;

public class TeamExtractor {

	public static void main(String[] args) {

		// String csvFile =
		// "/Users/jinyongshin/Dropbox/DBFinal/national/list_of_leagues.csv";
		BufferedReader br = null;
		String line = "";
		String cvsSplitBy = ",";
		// write in fileString
		String textList = "/Users/jinyongshin/Desktop/Database_Final/AllLeagues/LALIGA/name.txt";
		BufferedReader br_list = null;
		BufferedWriter bw = null;
		try {
			String Name = "";
			String savedFile = "/Users/jinyongshin/Desktop/Database_Final/AllLeagues/LaTeams.txt";
			File file = new File(savedFile);
			FileWriter fw = new FileWriter(file.getAbsoluteFile());
			HashMap<String, Integer> teams = new HashMap<String, Integer>();
			br_list = new BufferedReader(new FileReader(textList));
			bw = new BufferedWriter(fw);
			while ((Name = br_list.readLine()) != null) {
				String csvFile = "/Users/jinyongshin/Desktop/Database_Final/AllLeagues/LALIGA/" + Name;
				
				br = new BufferedReader(new FileReader(csvFile));
				while ((line = br.readLine()) != null) {
					Scanner kb = new Scanner(line);
					kb.next();
					String team = kb.next() + "\n";
					if (!teams.containsKey(line)) {
						teams.put(team, 1);
					}
					
				}
			}
			SortedSet<String> keys = new TreeSet<String>(teams.keySet());
			for (String key : keys) {
				bw.write(key);
			}
			
		} catch (FileNotFoundException e) {
			e.printStackTrace();
		} catch (IOException e) {
			e.printStackTrace();
		} finally {
			if (br != null) {
				try {
					br.close();
					bw.close();
					br_list.close();
				} catch (IOException e) {
					e.printStackTrace();
				}
			}
		}

	}

}