<h1>📊Data Analytics Activities Repository</h1>

<p><strong>Course:</strong> Data Analytics<br>
<strong>Authors:</strong> Shawn Jurgen Mayol, Elgen Mar Arinasa<br>
<strong>University:</strong> University of San Carlos</p>

<hr>

<h2>🔍 Overview</h2>
<p>This repository contains implementations of various assignments from our <strong>Data Analytics course</strong>. 
Each assignment explores different <strong>analytical techniques, data processing methods, and visualization strategies</strong>. 
The goal is to apply theoretical concepts to real-world datasets and develop proficiency in Python for data analysis.</p>

<hr>

<h2>📌 Assignments</h2>
<p>Each assignment is structured as a <strong>Jupyter Notebook (.ipynb)</strong> or <strong>Python script (.py)</strong>, 
with clear documentation and visualization of results.</p>

<h3>📂 Assignment 1: Balanced Risk Set Matching</h3>
<ul>
  <li><strong>Objective:</strong> Implement the <em>Balanced Risk Set Matching Algorithm</em> for an observational study analyzing 
      the effects of <strong>Cystoscopy and Hydrodistention</strong> on <strong>Interstitial Cystitis</strong> patients.</li>
  <li><strong>Key Steps:</strong>
    <ol>
      <li>Load patient data from a CSV file.</li>
      <li>Compute <strong>Mahalanobis distances</strong> to compare treated and control patients.</li>
      <li>Identify feasible <strong>treated-control pairs</strong>, ensuring treatment time constraints.</li>
      <li>Solve <strong>Integer Programming (IP)</strong> to determine the optimal matching.</li>
      <li>Analyze <strong>treatment effects</strong> (compare symptom changes between groups).</li>
      <li>Perform <strong>sensitivity analysis</strong> to check robustness of findings.</li>
    </ol>
  </li>
  <li><strong>Tech Stack:</strong> <code>pandas</code>, <code>numpy</code>, <code>scipy</code>, <code>matplotlib</code>, <code>seaborn</code></li> (and more)
</ul>

<h3>📂 Assignment 2: Data Visualization & Network Analysis</h3>
<ul>
  <li><strong>Objective:</strong> Utilize data visualization techniques to analyze relationships and distributions.</li>
  <li><strong>Key Steps:</strong>
    <ol>
      <li><strong>Bar Chart Analysis:</strong> Visualize the distribution of Yes/No responses by category.</li>
      <li><strong>Sankey Diagram:</strong> Illustrate the flow distribution between different categories.</li>
      <li><strong>Network Graph:</strong> Construct a network of category connections, highlighting core and external nodes.</li>
    </ol>
  </li>
  <li><strong>Tech Stack:</strong> Python (Matplotlib, Seaborn, Plotly, NetworkX)</li>
  <li><strong>Generated Visualizations:</strong>
    <ul>
      <li>📊 <em>Bar Graph:</em> Displays Yes/No distribution across labeled categories.</li>
      <li>🔗 <em>Network Graph:</em> Maps node connections, distinguishing between core and external entities.</li>
      <li>📈 <em>Sankey Diagram:</em> Represents flow relationships between categorized entities.</li>
    </ul>
  </li>
</ul>


<h3>📂 Assignment 3: For Clustering: Sessa Empirical Estimator</h3>
<ul>
  <li><strong>Objective:</strong> Apply clustering techniques (K-Means and DBSCAN) to prescription duration data using the <em>Sessa Empirical Estimator (SEE)</em> method.</li>
  <li><strong>Key Steps:</strong>
    <ol>
      <li>Preprocess and clean the dataset, ensuring accurate calculations of prescription duration intervals.</li>
      <li>Implement K-Means and DBSCAN clustering algorithms to identify patterns in prescription refill behavior.</li>
      <li>Compare the performance of both algorithms using silhouette scores and other evaluation metrics.</li>
      <li>Visualize the clustering results, comparing patterns in dosage per day and prescription duration.</li>
      <li>Analyze the clinical implications of the clustering results, focusing on improving patient adherence and healthcare management.</li>
    </ol>
  </li>
  <li><strong>Tech Stack:</strong> <code>pandas</code>, <code>numpy</code>, <code>matplotlib</code>, <code>seaborn</code>, <code>sklearn</code> (DBSCAN, K-Means)</li>
</ul>

<hr>

<h2>📈 Visual Representations</h2>
<p>This repository includes:</p>
<ul>
  <li>✅ <strong>Data visualizations</strong> using <code>matplotlib</code> and <code>seaborn</code></li>
  <li>✅ <strong>Statistical analysis</strong> and <strong>data preprocessing</strong></li>
  <li>✅ <strong>Interactive data exploration</strong> via Jupyter Notebooks</li>
</ul>

<h4>Sample Output:</h4>
<p>(Include example graphs and insights from the analysis.)</p>
<img src="https://github.com/user-attachments/assets/2a649162-e4f1-4381-9381-9baee4857074" alt="Descriptive Alt Text" width="600">




<hr>

<h2>🛠 Setup & Usage</h2>
<p>To run the notebooks or scripts in this repository:</p>

<ol>
  <li>Clone the repository:
    <pre><code>git clone https://github.com/yourusername/DataAnalytics_Activities.git</code></pre>
  </li>
  <li>Install dependencies:
    <pre><code>pip install -r requirements.txt</code></pre>
  </li>
  <li>Open Jupyter Notebook:
    <pre><code>jupyter notebook</code></pre>
  </li>
  <li>Navigate to the desired <code>.ipynb</code> file and run the cells.</li>
</ol>

<hr>

<h2>📜 Conclusion</h2>
<p>This repository serves as a <strong>portfolio of data analytics projects</strong>, demonstrating various <strong>data processing, statistical analysis, and visualization techniques</strong>.</p>


<hr>


