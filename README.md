# DNase-seq_RNNs_vs_CNNs



This project aims to systematically compare Recurrent Neural Networks (RNNs) and Convolutional Neural Networks (CNNs) in the context of genomic sequence classification. By evaluating these two fundamental deep learning architectures, we seek to understand their relative strengths, limitations, and optimal use cases in genomic analysis tasks.

The comparison will focus on both performance metrics and computational efficiency, providing practical insights for researchers and practitioners in the field of computational genomics. This analysis will help inform architecture choices for future genomic classification projects.

---

## Project Objectives

- [ ]  Compare accuracy, ROC-AUC, etc
- [ ]  Compare hardware usage (CPU, GPU, RAM, Time)

---

## Rationale for such project?

1. Practicing DNase-seq data handling and analysis
2. Practicing relevant deep learning methods for genomic analysis
3. Making sense of method choices for future work by benchmarking

---

## RNN methods in genomics

When examining RNN methods in genomic sequence analysis, three key architectures have proven particularly effective: LSTM (Long Short-Term Memory), GRU (Gated Recurrent Unit), and Bidirectional RNNs. These architectures excel at capturing sequential dependencies in DNA/RNA sequences, making them valuable for tasks like gene expression prediction and splice site recognition. Their ability to maintain long-range memory makes them especially suitable for analyzing regulatory elements and complex genetic patterns.

## CNN methods in genomics

When focusing on the **most commonly used CNN-based methods in genomics**, these three approaches stand out due to their effectiveness, prevalence in research, and adaptability to various genomic tasks:

---

### **1. One-Hot Encoding with Convolutional Networks**

- **Overview**: The simplest and most widely used method in genomics. Sequences are encoded as one-hot matrices, where rows represent bases (A, C, G, T) and columns represent positions in the sequence. This encoding serves as the input to a standard convolutional neural network.
- **Why Popular**:
    - Straightforward and interpretable.
    - Convolutional layers detect motifs and patterns effectively.
    - Suitable for tasks like transcription factor binding site prediction, enhancer classification, and motif discovery.
- **Applications**:
    - *DeepBind*: One of the first CNN models for genomics, designed to predict protein-DNA interactions.
    - *DanQ*: Combines CNNs for motif detection with RNNs for sequence dependencies.
- **Limitations**:
    - High memory usage for large sequences due to sparse one-hot encoding.
    - Limited ability to capture long-range dependencies without additional layers or mechanisms.

---

### **2. K-mer Embeddings with CNNs**

- **Overview**: Instead of one-hot encoding, sequences are represented as k-mers (short substrings of length k). K-mers are embedded into dense vectors (similar to word embeddings in NLP), reducing input dimensionality and capturing relationships between k-mers.
- **Why Popular**:
    - Dense embeddings overcome the sparsity of one-hot encoding.
    - Captures semantic similarity between k-mers, improving downstream performance.
    - Easily integrates with standard CNN architectures.
- **Applications**:
    - Pre-trained embeddings like *DNA2Vec* or task-specific embeddings can significantly improve performance in classification tasks.
    - Ideal for enhancer/promoter classification, mutation impact analysis, and functional annotation.
- **Limitations**:
    - Choice of k impacts model performance (too small = loss of specificity, too large = sparse data).
    - Pretraining embeddings may introduce domain biases.

---

### **3. Multi-scale Convolutional Neural Networks**

- **Overview**: Uses multiple convolutional filters of varying kernel sizes within the same layer, enabling the model to capture patterns at different lengths simultaneously (short motifs, medium-length regions, long-range patterns).
- **Why Popular**:
    - Genomic motifs often occur at varying scales; multi-scale CNNs can identify them without manual feature engineering.
    - Combines efficiency with flexibility, avoiding the need for separate models for different scales.
- **Applications**:
    - *DeepSEA*: Predicts chromatin effects of sequence variants using multi-scale convolutions.
    - *Basset*: Focuses on DNA accessibility prediction across cell types.
- **Limitations**:
    - Computationally intensive due to increased parameter count.
    - Requires careful tuning of kernel sizes and network depth.

---

### **Why These Methods?**

These three methods—one-hot encoding, k-mer embeddings, and multi-scale CNNs—have become go-to approaches because they balance **accuracy**, **interpretability**, and **scalability**. They also form the basis for more advanced hybrid models, making them a solid foundation for further exploration.

---

### **Why ENCODE?**

- **Rich Annotations**: Covers many regulatory elements across multiple cell types and conditions.
- **High-Quality Data**: Experiments are validated and reproducible.
- **Broad Applicability**: Can be used for tasks like binding site prediction, chromatin accessibility analysis, and enhancer classification.